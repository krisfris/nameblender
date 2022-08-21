<script setup>
import { ExternalLinkIcon } from "@heroicons/vue/solid";
</script>

<template>
  <footer
    class="container mx-auto shadow md:flex md:items-center md:justify-between py-2"
  >
    <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400"
      >© 2022
      <RouterLink to="/" class="hover:underline">nameblender</RouterLink>
    </span>
    <ul
      class="flex flex-wrap items-center mt-3 text-sm text-gray-500 dark:text-gray-400 sm:mt-0 px-4"
    >
      <li>
        <RouterLink to="/about" class="mr-4 hover:underline md:mr-6"
          >About</RouterLink
        >
      </li>
      <li>
        <a
          href="https://github.com/krisfris/nameblender"
          class="mr-4 hover:underline md:mr-6"
          >GitHub<!--<ExternalLinkIcon class="h-5 w-5 inline-block pb-1"/>--></a
        >
      </li>
    </ul>
  </footer>
</template>
