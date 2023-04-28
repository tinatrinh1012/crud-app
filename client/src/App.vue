<template>

  <table>
    <tr>
      <th>ID</th>
      <th>Manufactuer</th>
      <th>Type Name</th>
      <th>Type ID</th>
      <th>Style Name</th>
      <th>Style ID</th>
      <th>Color #</th>
      <th>Color Name</th>
      <th>Size</th>
    </tr>
    <tr v-for="job in jobs" :key="job.id">
      <td>{{ job.id }}</td>
      <td>{{ mfr[job.mfr_record_id] }}</td>
      <td>{{ type[job.type_record_id]["type_name"] }}</td>
      <td>{{ type[job.type_record_id]["type_id"] }}</td>
      <td>{{ style[job.style_record_id]["style_name"] }}</td>
      <td>{{ style[job.style_record_id]["style_id"] }}</td>
      <td>{{ color[job.color_record_id]["color_num"] }}</td>
      <td>{{ color[job.color_record_id]["color_name"] }}</td>
      <td>{{ size[job.size_record_id] }}</td>
    </tr>
  </table>

</template>

<script>
export default {
  name: 'App',

  data() {
    return {
      jobs: [],
      mfr: {},
      type: {},
      style: {},
      color: {},
      size: {}
    }
  },

  components: {
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

<style>

</style>
