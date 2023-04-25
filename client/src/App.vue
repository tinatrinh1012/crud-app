<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <HelloWorld msg="Welcome to Your Vue.js App"/>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',

  components: {
    HelloWorld
  },

  methods: {
    async testFetchData() {
      const response = await fetch("http://localhost:3001/");
      const data = await response.json();
      console.log(data);
      return data;
    }
  }
}
</script>

<style>

</style>
