<template>
    <!-- Navbar component -->
    <navbar />
    <!-- Router view component -->
    <router-view />
</template>

<script lang="ts">
import SideBar from './components/SideBar.vue'


export default {
  name: 'App',
  components: {
    navbar: SideBar
  }
}
</script>
