import React from "react";
import BestSeller from "../components/home/BestSeller";
import NewProduct from "../components/home/NewProduct";
import SearchCard from '../components/card/SearchCard'

import bannerImage from "../assets/banner.webp";

const Home = () => {
  return (
    <div className="bg-gray-100 min-h-screen font-sans">
      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Full-Width Banner with Tech Theme */}
          <div className="relative mb-12 rounded-xl shadow-lg overflow-hidden group">
            <img
              src={bannerImage}
              alt="Tech Banner"
              className="w-full h-96 object-cover rounded-xl transition-all duration-500 group-hover:scale-105"
            />
            <div className="absolute inset-0 bg-gradient-to-r from-blue-900/70 to-purple-900/70 flex items-center rounded-xl">
              <div className="px-12 max-w-2xl">
                <h1 className="text-4xl md:text-5xl font-bold text-white mb-4">
            อัพเกรดอุปกรณ์ไอทีของคุณวันนี้
                </h1>
                <p className="text-xl text-blue-100 mb-6">
            ค้นพบเทคโนโลยีล่าสุดในราคาสุดพิเศษ
                </p>
                <button
            onClick={() => (window.location.href = "/shop")}
            className="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-lg shadow-md transition-all duration-300 transform hover:scale-105"
                >
            ช็อปเลย
                </button>
              </div>
            </div>
          </div>

          {/* Best Seller Section */}
        <section className="mb-16 bg-white p-6 rounded-xl shadow-md">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-gray-800">
              <span className="text-blue-600" lang="th">
                สินค้า
              </span>{" "}
              <span lang="th">ขายดี</span>
            </h2>
            <button
              className="text-purple-600 hover:text-purple-800 font-medium flex items-center"
              onClick={() => (window.location.href = "/shop")}
            >
              <span lang="th">ดูทั้งหมด</span>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-5 w-5 ml-1"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fillRule="evenodd"
                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                  clipRule="evenodd"
                />
              </svg>
            </button>
          </div>
          <BestSeller />
        </section>

        {/* New Products Section */}
        <section className="bg-white p-6 rounded-xl shadow-md">
          <div className="flex items-center justify-between mb-8">
            <h2 className="text-3xl font-bold text-gray-800">
              <span className="text-purple-600">สินค้า</span> ใหม่ล่าสุด
            </h2>
            <button
              onClick={() => (window.location.href = "/shop")}
              className="text-purple-600 hover:text-purple-800 font-medium flex items-center"
            >
              ดูทั้งหมด
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-5 w-5 ml-1"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fillRule="evenodd"
                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                  clipRule="evenodd"
                />
              </svg>
            </button>
          </div>
          <NewProduct />
        </section>

        {/* Tech Categories Banner */}
        <div className="mt-12 grid grid-cols-2 md:grid-cols-4 gap-4">
          <div className="bg-gradient-to-br from-blue-500 to-blue-700 p-6 rounded-xl shadow-md text-white hover:shadow-lg transition-all">
            <h3 className="font-bold text-xl mb-2">โน๊ตบุ๊ค</h3>
            <p className="text-blue-100">รุ่นใหม่ล่าสุด</p>
          </div>
          <div className="bg-gradient-to-br from-purple-500 to-purple-700 p-6 rounded-xl shadow-md text-white hover:shadow-lg transition-all">
            <h3 className="font-bold text-xl mb-2">สมาร์ทโฟน</h3>
            <p className="text-purple-100">เทคโนโลยีล้ำสมัย</p>
          </div>
          <div className="bg-gradient-to-br from-green-500 to-green-700 p-6 rounded-xl shadow-md text-white hover:shadow-lg transition-all">
            <h3 className="font-bold text-xl mb-2">อุปกรณ์เกมมิ่ง</h3>
            <p className="text-green-100">ประสบการณ์ระดับโปร</p>
          </div>
          <div className="bg-gradient-to-br from-red-500 to-red-700 p-6 rounded-xl shadow-md text-white hover:shadow-lg transition-all">
            <h3 className="font-bold text-xl mb-2">อุปกรณ์ออฟฟิศ</h3>
            <p className="text-red-100">เพิ่มประสิทธิภาพการทำงาน</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
