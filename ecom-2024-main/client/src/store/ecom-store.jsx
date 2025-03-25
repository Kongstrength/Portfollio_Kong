import axios from "axios";
import { create } from "zustand";
import { persist, createJSONStorage } from "zustand/middleware";
import { listCategory } from "../api/Category";
import { listProduct, searchFilters } from "../api/product";
import { getOrdersAdmin } from "../api/admin";
import _ from "lodash";

const ecomStore = (set, get) => ({
  user: null,
  token: null,
  categories: [],
  products: [],
  carts: [],
  logout: () => {
    set({
      user: null,
      token: null,
      categories: [],
      products: [],
      carts: [],
    });
  },
  actionAddtoCart: (product) => {
    const carts = get().carts;
    const updateCart = [...carts, { ...product, count: 1 }];
    const uniqe = _.unionWith(updateCart, _.isEqual);
    set({ carts: uniqe });
  },
  actionUpdateQuantity: (productId, newQuantity) => {
    set((state) => ({
      carts: state.carts.map((item) =>
        item.id === productId
          ? { ...item, count: Math.max(1, newQuantity) }
          : item
      ),
    }));
  },
  actionRemoveProduct: (productId) => {
    set((state) => ({
      carts: state.carts.filter((item) => item.id !== productId),
    }));
  },
  getTotalPrice: () => {
    return get().carts.reduce((total, item) => {
      return total + item.price * item.count;
    }, 0);
  },
  actionLogin: async (form) => {
    const res = await axios.post("http://localhost:5001/api/login", form);
    set({
      user: res.data.payload,
      token: res.data.token,
    });
    return res;
  },
  getCategory: async () => {
    try {
      const res = await listCategory();
      set({ categories: res.data });
    } catch (err) {
      console.log(err);
    }
  },
  getProduct: async (count) => {
    try {
      const res = await listProduct(count);
      console.log("Fetched products:", res.data);
      if (Array.isArray(res.data)) {
        set({ products: res.data });
      } else {
        set({ products: [] });
      }
    } catch (err) {
      console.log("Error fetching products:", err);
      set({ products: [] });
    }
  },

  getOrdersAdmin: async () => {
    try {
      const response = await axios.get("http://localhost:5001/api/admin/orders");
      set({ orders: response.data });
    } catch (err) {
      console.error("Error fetching orders:", err);
      throw err;
    }
  },

  actionSearchFilters: async (arg) => {
    try {
      const res = await searchFilters(arg);
      console.log("Search results:", res.data);
      if (Array.isArray(res.data)) {
        set({ products: res.data });
      } else {
        set({ products: [] });
      }
    } catch (err) {
      console.log("Error searching products:", err);
      set({ products: [] });
    }
  },
  clearCart: () => {
    set({ carts: [] });
  },
}); // ✅ ปิดฟังก์ชัน ecomStore อย่างถูกต้อง

const usePersist = {
  name: "ecom-store",
  storage: createJSONStorage(() => localStorage),
};

const useEcomStore = create(persist(ecomStore, usePersist));

export default useEcomStore;
