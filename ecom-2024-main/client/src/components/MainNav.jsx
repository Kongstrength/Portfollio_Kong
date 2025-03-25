import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import useEcomStore from "../store/ecom-store";
import { ChevronDown } from "lucide-react";
import logo from "../assets/logo.webp"; // นำเข้าโลโก้

function MainNav() {
  const carts = useEcomStore((s) => s.carts);
  const user = useEcomStore((s) => s.user);
  const logout = useEcomStore((s) => s.logout);
  const [isOpen, setIsOpen] = useState(false);

  const toggleDropdown = () => setIsOpen(!isOpen);

  return (
    <nav className="bg-[#212123] shadow-lg">
      <div className="container mx-auto px-6">
        <div className="flex justify-between items-center h-16 flex-wrap">
          {/* โลโก้ (ไม่เป็นลิงก์) */}
          <div className="flex items-center">
            <img
              src={logo}
              alt="Logo"
              className="h-12 md:h-16 lg:h-20 w-auto"
            />
          </div>

          {/* เมนูหลัก */}
          <div className="flex items-center space-x-4 md:space-x-6">
            {[
              { name: "Home", path: "/" },
              { name: "Shop", path: "/shop" },
              { name: "Cart", path: "/cart" },
            ].map(({ name, path }, index) => (
              <NavLink
                key={index}
                className={({ isActive }) =>
                  `px-4 py-2 rounded-md text-sm font-medium transition ${
                    isActive
                      ? "bg-[#3BADE9] text-white"
                      : "hover:bg-gray-700 text-white"
                  }`
                }
                to={path}
              >
                {name}
                {name === "Cart" && carts.length > 0 && (
                  <span className="ml-2 bg-red-500 text-white text-xs px-2 py-1 rounded-full">
                    {carts.length}
                  </span>
                )}
              </NavLink>
            ))}
          </div>

          {/* เมนู User */}
          {user ? (
            <div className="relative">
              <button
                onClick={toggleDropdown}
                className="flex items-center gap-2 hover:bg-gray-700 px-3 py-2 rounded-md transition text-white"
              >
                <img
                  className="w-8 h-8 rounded-full border border-gray-300"
                  src="https://cdn.iconscout.com/icon/free/png-512/free-avatar-icon-download-in-svg-png-gif-file-formats--user-professor-avatars-flat-icons-pack-people-456317.png?f=webp&w=256"
                  alt="User"
                />
                <ChevronDown className="text-white" />
              </button>

              {/* Dropdown Menu */}
              {isOpen && (
                <div className="absolute right-0 mt-2 bg-white border shadow-lg rounded-lg w-40 z-50">
                  <NavLink
                    to="/user/history"
                    className="block px-4 py-2 hover:bg-gray-100"
                  >
                    History
                  </NavLink>
                  <button
                    onClick={logout}
                    className="block w-full text-left px-4 py-2 hover:bg-gray-100"
                  >
                    Logout
                  </button>
                </div>
              )}
            </div>
          ) : (
            <div className="flex items-center space-x-4">
              {["Register", "Login"].map((item, index) => (
                <NavLink
                  key={index}
                  className={({ isActive }) =>
                    `px-4 py-2 rounded-md text-sm font-medium transition ${
                      isActive
                        ? "bg-[#3BADE9] text-white"
                        : "hover:bg-gray-700 text-white"
                    }`
                  }
                  to={`/${item.toLowerCase()}`}
                >
                  {item}
                </NavLink>
              ))}
            </div>
          )}
        </div>
      </div>
    </nav>
  );
}

export default MainNav;
