<script setup>
import { RouterLink, RouterView } from "vue-router";
import Navbar from "@/components/Navbar.vue";
import Footer from "@/components/Footer.vue";
</script>

<template>
  <div class="bg-white dark:bg-gray-900 dark:text-white h-full flex flex-col">
    <Navbar />
    <div class="grow container mx-auto">
      <RouterView />
    </div>
    <Footer />
  </div>
</template>
