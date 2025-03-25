import { useState, useEffect } from 'react';
import { getOrdersAdmin } from "../../api/admin"; // ฟังก์ชันในการดึงข้อมูลคำสั่งซื้อจาก API
import useEcomStore from "../../store/ecom-store"; // ฟังก์ชันสำหรับจัดการข้อมูล store ของ ecom
import { numberFormat } from "../../utils/number"; // ฟังก์ชันในการจัดรูปแบบตัวเลข
import { Pie } from "react-chartjs-2";
import {
  Chart as ChartJS,
  ArcElement, // ลงทะเบียน ArcElement สำหรับ Pie Chart
  Tooltip,
  Legend,
} from "chart.js";

ChartJS.register(ArcElement, Tooltip, Legend);

const options = {
  responsive: true,
  maintainAspectRatio: false,
};

const Dashboard = () => {
  const token = useEcomStore((state) => state.token);
  const [orders, setOrders] = useState([]);
  const [yesterdayOrders, setYesterdayOrders] = useState([]);
  const [topProducts, setTopProducts] = useState([]);

  useEffect(() => {
    handleGetOrder(token);
  }, []);

  const handleGetOrder = (token) => {
    getOrdersAdmin(token)
      .then((res) => {
        console.log("API Response:", res.data);
        setOrders(res.data);
        calculateTopProducts(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };



  // คำนวณยอดขายทั้งหมดของวันนี้
  const todayRevenue = orders.reduce((total, order) => total + order.cartTotal, 0);
  const yesterdayRevenue = yesterdayOrders.reduce((total, order) => total + order.cartTotal, 0);
  const todayOrders = orders.length;
  const yesterdayOrdersCount = yesterdayOrders.length;
  const todayCustomers = new Set(orders.map((order) => order.orderedBy.email)).size;
  const yesterdayCustomers = new Set(yesterdayOrders.map((order) => order.orderedBy.email)).size;


   // คำนวณเปอร์เซ็นต์การเปลี่ยนแปลง
   const calculatePercentageChange = (today, yesterday) => {
    if (yesterday === 0) return today > 0 ? 100 : 0; // กรณีเมื่อวานไม่มีค่า
    return ((today - yesterday) / yesterday) * 100;
  };
  const revenueChange = calculatePercentageChange(todayRevenue, yesterdayRevenue);
  const ordersChange = calculatePercentageChange(todayOrders, yesterdayOrdersCount);
  const customersChange = calculatePercentageChange(todayCustomers, yesterdayCustomers);


  // คำนวณยอดขายรายเดือน
  const calculateMonthlySales = (orders) => {
    const monthlySales = {};
    orders.forEach((order) => {
      const orderDate = new Date(order.createdAt);
      const month = orderDate.toLocaleString("default", { month: "long" });
      const amount = order.cartTotal;
      monthlySales[month] = (monthlySales[month] || 0) + amount;
    });
    const labels = Object.keys(monthlySales);
    const salesData = Object.values(monthlySales);
    return { labels, salesData };
  };

  // คำนวณสินค้าขายดี
  const calculateTopProducts = (orders) => {
    const productSales = {};
    orders.forEach((order) => {
      order.products.forEach((product) => {
        if (product.product) {
          if (productSales[product.product.id]) {
            productSales[product.product.id].sales += product.count;
          } else {
            productSales[product.product.id] = {
              id: product.product.id,
              name: product.product.title,
              price: product.product.price,
              sales: product.count,
              stock: product.product.quantity,
              status:
                product.product.quantity > 0 ? "In Stock" : "Out of Stock",
              images: product.product.images || [],
            };
          }
        }
      });
    });
    const sortedProducts = Object.values(productSales).sort(
      (a, b) => b.sales - a.sales
    );
    setTopProducts(sortedProducts.slice(0, 5));
  };

  const { labels, salesData } = calculateMonthlySales(orders);

  const salesAnalyticsData = {
    labels: labels,
    datasets: [
      {
        label: "Sales Revenue",
        data: salesData,
        backgroundColor: [
          "#FF6384",
          "#36A2EB",
          "#FFCE56",
          "#4BC0C0",
          "#9966FF",
          "#FF9F40",
        ],
        borderColor: "#ffffff",
        borderWidth: 1,
      },
    ],
  };

  return (
    <div className="container mx-auto p-6 bg-gray-50 min-h-screen">
      <h2 className="text-2xl font-bold text-gray-800 mb-6 text-center">
        Dashboard - Sales Summary
      </h2>

     {/* Today's Summary Cards */}
     <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div className="bg-green-100 p-6 rounded-lg shadow-md flex flex-col items-center">
          <p className="font-semibold text-lg">Today's Revenue</p>
          <p className="text-3xl font-bold mt-2">฿{numberFormat(todayRevenue)}</p>
          <p className={`mt-1 ${revenueChange >= 0 ? "text-green-600" : "text-red-600"}`}>
            {revenueChange >= 0 ? "+" : ""}
            {revenueChange.toFixed(1)}% from yesterday
          </p>
        </div>
        <div className="bg-blue-100 p-6 rounded-lg shadow-md flex flex-col items-center">
          <p className="font-semibold text-lg">Today's Orders</p>
          <p className="text-3xl font-bold mt-2">{todayOrders}</p>
          <p className={`mt-1 ${ordersChange >= 0 ? "text-green-600" : "text-red-600"}`}>
            {ordersChange >= 0 ? "+" : ""}
            {ordersChange.toFixed(1)}% from yesterday
          </p>
        </div>
        <div className="bg-purple-100 p-6 rounded-lg shadow-md flex flex-col items-center">
          <p className="font-semibold text-lg">New Customers</p>
          <p className="text-3xl font-bold mt-2">{todayCustomers}</p>
          <p className={`mt-1 ${customersChange >= 0 ? "text-green-600" : "text-red-600"}`}>
            {customersChange >= 0 ? "+" : ""}
            {customersChange.toFixed(1)}% from yesterday
          </p>
        </div>
      </div>

      {/* Sales Analytics Pie Chart */}
      <div className="mb-8">
        <h3 className="text-xl font-semibold text-gray-700 mb-4 text-center">
          Sales Analytics
        </h3>
        <div className="w-72 h-72 mx-auto">
          <Pie data={salesAnalyticsData} options={options} />
        </div>
      </div>

      {/* Best Selling Products Table */}
      <div className="mb-8">
        <h3 className="text-xl font-semibold text-gray-700 mb-4">
          Best Selling Products
        </h3>
        <div className="overflow-x-auto shadow-md rounded-lg">
          <table className="min-w-full bg-white">
            <thead className="bg-gray-200">
              <tr>
                <th className="py-3 px-4 text-left">Product ID</th>
                <th className="py-3 px-4 text-left">Image</th>
                <th className="py-3 px-4 text-left">Product Name</th>
                <th className="py-3 px-4 text-left">Price</th>
                <th className="py-3 px-4 text-left">Total Sales</th>
                <th className="py-3 px-4 text-left">Stock</th>
                <th className="py-3 px-4 text-left">Status</th>
              </tr>
            </thead>
            <tbody>
              {topProducts && topProducts.length > 0 ? (
                topProducts.map((product, index) => (
                  <tr key={index} className="border-b hover:bg-gray-50">
                    <td className="py-3 px-4">{product.id}</td>
                    <td className="py-3 px-4">
  {Array.isArray(product.images) && product.images.length > 0 ? (
    <div className="flex space-x-2">
      {product.images.map((img, idx) => ( 
        <img
          key={idx}
          src={img.secure_url || img.url || "https://via.placeholder.com/100"}
          alt={product.name || "Product Image"}
          className="w-16 h-16 object-cover rounded"
        />
      ))}
    </div>
  ) : (
    <img
      src="https://via.placeholder.com/100"
      alt="No Image"
      className="w-16 h-16 object-cover rounded"
    />
  )}
</td>

                    <td className="py-3 px-4">{product.name}</td>
                    <td className="py-3 px-4">{product.price}</td>
                    <td className="py-3 px-4">{product.sales}</td>
                    <td className="py-3 px-4">{product.stock}</td>
                    <td className="py-3 px-4">
                      <span
                        className={`font-semibold ${
                          product.status === "In Stock"
                            ? "text-green-600"
                            : product.status === "Out of Stock"
                            ? "text-red-600"
                            : "text-yellow-600"
                        }`}
                      >
                        {product.status}
                      </span>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="7" className="py-4 text-center text-gray-500">
                    No Products Found
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
