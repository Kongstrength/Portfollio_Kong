import React, { useState, useEffect } from "react";
import { getOrders } from "../../api/user";
import useEcomStore from "../../store/ecom-store";
import { dateFormat } from "../../utils/dateformat";
import { numberFormat } from "../../utils/number";

const HistoryCard = () => {
  const token = useEcomStore((state) => state.token);
  const [orders, setOrders] = useState([]);
  const [filteredOrders, setFilteredOrders] = useState([]);
  const [selectedStatus, setSelectedStatus] = useState("All");
  const [dateRange, setDateRange] = useState({
    start: "",
    end: ""
  });

  useEffect(() => {
    hdlGetOrders(token);
  }, []);

  useEffect(() => {
    let result = [...orders];
    
    // Apply status filter
    if (selectedStatus !== "All") {
      result = result.filter((order) => order.orderStatus === selectedStatus);
    }
    
    // Apply date filter if dates are selected
    if (dateRange.start && dateRange.end) {
      const startDate = new Date(dateRange.start);
      const endDate = new Date(dateRange.end);
      
      result = result.filter((order) => {
        const orderDate = new Date(order.updatedAt);
        return orderDate >= startDate && orderDate <= endDate;
      });
    }
    
    setFilteredOrders(result);
  }, [selectedStatus, orders, dateRange]);

  const hdlGetOrders = (token) => {
    getOrders(token)
      .then((res) => {
        setOrders(res.data.orders);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const getStatusColor = (status) => {
    switch (status) {
      case "Not Process":
        return "bg-gray-200 text-gray-700";
      case "Processing":
        return "bg-blue-200 text-blue-700";
      case "Completed":
        return "bg-green-200 text-green-700";
      case "Cancelled":
        return "bg-red-200 text-red-700";
      default:
        return "bg-gray-200 text-gray-700";
    }
  };

  const handleDateChange = (e) => {
    const { name, value } = e.target;
    setDateRange(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const clearDateFilter = () => {
    setDateRange({
      start: "",
      end: ""
    });
  };

  return (
    <div className="space-y-8 p-8 bg-white rounded-lg shadow-lg max-w-7xl mx-auto">
      <h1 className="text-3xl font-semibold text-gray-800">
        ประวัติการสั่งซื้อ
      </h1>

      {/* Filter Section */}
      <div className="mb-6 grid grid-cols-1 md:grid-cols-3 gap-4">
        {/* Status Filter */}
        <div>
          <label htmlFor="order-status" className="block text-gray-600 mb-2">
            กรองตามสถานะ:
          </label>
          <select
            id="order-status"
            value={selectedStatus}
            onChange={(e) => setSelectedStatus(e.target.value)}
            className="w-full p-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="All">ทั้งหมด</option>
            <option value="Not Process">ยังไม่ดำเนินการ</option>
            <option value="Processing">กำลังดำเนินการ</option>
            <option value="Completed">เสร็จสิ้น</option>
            <option value="Cancelled">ยกเลิก</option>
          </select>
        </div>

        {/* Date Range Filter */}
        <div>
          <label className="block text-gray-600 mb-2">กรองตามวันที่:</label>
          <div className="flex space-x-2">
            <input
              type="date"
              name="start"
              value={dateRange.start}
              onChange={handleDateChange}
              className="w-full p-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <span className="flex items-center">ถึง</span>
            <input
              type="date"
              name="end"
              value={dateRange.end}
              onChange={handleDateChange}
              className="w-full p-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            {dateRange.start || dateRange.end ? (
              <button
                onClick={clearDateFilter}
                className="px-3 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300"
              >
                ล้าง
              </button>
            ) : null}
          </div>
        </div>
      </div>

      {/* Orders List */}
      <div className="space-y-6">
        {filteredOrders.length > 0 ? (
          filteredOrders.map((item, index) => (
            <div
              key={index}
              className="bg-white p-6 rounded-lg shadow-md border border-gray-200 transition-all transform hover:scale-105 hover:shadow-xl"
            >
              {/* Order Header */}
              <div className="flex justify-between mb-4">
                <div>
                  <p className="text-sm text-gray-500">วันที่สั่งซื้อ</p>
                  <p className="font-bold text-gray-800">
                    {dateFormat(item.updatedAt)}
                  </p>
                </div>
                <div>
                  <span
                    className={`${getStatusColor(
                      item.orderStatus
                    )} px-4 py-2 rounded-full text-sm font-semibold`}
                  >
                    {item.orderStatus}
                  </span>
                </div>
              </div>

              {/* Product Table */}
              <div className="overflow-x-auto">
                <table className="min-w-full table-auto text-sm">
                  <thead>
                    <tr className="bg-gray-100">
                      <th className="px-6 py-3 text-left text-gray-700">
                        รูปสินค้า
                      </th>
                      <th className="px-6 py-3 text-left text-gray-700">
                        สินค้า
                      </th>
                      <th className="px-6 py-3 text-left text-gray-700">ราคา</th>
                      <th className="px-6 py-3 text-left text-gray-700">จำนวน</th>
                      <th className="px-6 py-3 text-left text-gray-700">รวม</th>
                    </tr>
                  </thead>
                  <tbody>
                    {item.products?.map((product, idx) => (
                      <tr
                        key={idx}
                        className="border-t hover:bg-gray-50 transition-all"
                      >
                        <td className="py-3 px-4">
                          {product.product.images && product.product.images.length > 0 ? (
                            <div className="flex space-x-2">
                              {product.product.images.map((img, idx) => (
                                <img
                                  key={idx}
                                  src={img.secure_url || img.url || "https://via.placeholder.com/100"}
                                  alt={product.product.title || "Product Image"}
                                  className="w-16 h-16 object-cover rounded"
                                  onError={(e) => {
                                    console.log("Error loading image:", e.target.src);
                                    e.target.src = "https://via.placeholder.com/100";
                                  }}
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
                        <td className="px-6 py-4">{product.product.title}</td>
                        <td className="px-6 py-4">
                          {numberFormat(product.product.price)}
                        </td>
                        <td className="px-6 py-4">{product.count}</td>
                        <td className="px-6 py-4">
                          {numberFormat(product.count * product.product.price)}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* Order Total */}
              <div className="mt-6 text-right">
                <p className="text-sm text-gray-500">ราคาสุทธิ</p>
                <p className="text-xl font-bold text-gray-800">
                  {numberFormat(item.cartTotal)}
                </p>
              </div>
            </div>
          ))
        ) : (
          <div className="text-center py-10">
            <p className="text-gray-500">ไม่พบรายการสั่งซื้อที่ตรงกับเงื่อนไขการค้นหา</p>
          </div>
        )}
      </div>
    </div>
  );
};

export default HistoryCard;