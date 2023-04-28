<template>
  <nav>
    <router-link to="/">Jobs</router-link> |
    <router-link to="/create-job">Add job</router-link>
  </nav>

  <router-view :jobs="jobs" :all-mfr="mfr" :all-type="type" :all-style="style" :all-color="color" :all-size="size"/>

</template>

<script>
  export default {
  name: 'App',

  data() {
    return {
      jobs: [],
      mfr: [],
      type: [],
      style: [],
      color: [],
      size: []
    }
  },

  async created() {
    this.jobs = await this.fetchJobs();
    this.mfr = await this.fetchMfr();
    this.type = await this.fetchType();
    this.style = await this.fetchStyle();
    this.color = await this.fetchColor();
    this.size = await this.fetchSize();
  },

  methods: {
    async fetchJobs() {
      const response = await fetch("http://localhost:3001/jobs");
      const jobsData = await response.json();
      return jobsData;
    },

    async fetchMfr() {
      const response = await fetch("http://localhost:3001/mfr");
      const mfrData = await response.json();
      return mfrData;
    },

    async fetchType() {
      const response = await fetch("http://localhost:3001/type");
      const typeData = await response.json();
      return typeData;
    },

    async fetchStyle() {
      const response = await fetch("http://localhost:3001/style");
      const styleData = await response.json();
      return styleData;
    },

    async fetchColor() {
      const response = await fetch("http://localhost:3001/color");
      const colorData = await response.json();
      return colorData;
    },

    async fetchSize() {
      const response = await fetch("http://localhost:3001/size");
      const sizeData = await response.json();
      return sizeData;
    }
  }
}
</script>
