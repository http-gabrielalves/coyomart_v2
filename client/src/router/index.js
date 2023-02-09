import { createRouter, createWebHistory } from 'vue-router'
import Home from '../Views/Home.vue'
import Products from '../Views/Products.vue'
import Users from '../Views/Users.vue'
import UserRegistration from '../Views/UserRegistration.vue'
import ProductRegistration from '../Views/ProductRegistration.vue'


const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: { title: 'Home' }
  },
  {
    path: '/products',
    name: 'Products',
    component: Products,
    meta: { title: 'Products' }
  },
  {
    path: '/users',
    name: 'Users',
    component: Users,
    meta: { title: 'Users' }
  },
  {
    path: '/UserRegistration',
    name: 'UserRegistration',
    component: UserRegistration,
    meta: { title: 'UserRegistration' }
  },
  {
    path: '/ProductRegistration',
    name: 'ProductRegistration',
    component: ProductRegistration,
    meta: { title: 'ProductRegistration' }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router