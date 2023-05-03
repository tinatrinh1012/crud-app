<template>
  <h2>Filters</h2>

  <form>
    <input type="text" placeholder="Search jobs" v-model="searchValue">

    <div>Manufacturer:</div>
    <select v-model="filterMfrId">
      <option :value="null">All</option>
      <option v-for="mfr in allMfr" :key="mfr.id" :value="mfr.id">{{ mfr.mfr_name }}</option>
    </select>

    <div>Type:</div>
    <select v-model="filterTypeId">
      <option :value="null">All</option>
      <option v-for="typeOption in allType" :key="typeOption.id" :value="typeOption.id">{{ typeOption.type_name }}</option>
    </select>

    <div>Style:</div>
    <select v-model="filterStyleId">
      <option :value="null">All</option>
      <option v-for="style in allStyle" :key="style.id" :value="style.id">{{ style.style_name }}</option>
    </select>

    <div>Color:</div>
    <select v-model="filterColorId">
      <option :value="null">All</option>
      <option v-for="color in allColor" :key="color.id" :value="color.id">{{ color.color_name }}</option>
    </select>

    <div>Size:</div>
    <select v-model="filterSizeId">
      <option :value="null">All</option>
      <option v-for="size in allSize" :key="size.id" :value="size.id">{{ size.size }}</option>
    </select>

    <div>
      <button type="submit" @click.prevent="filterJobsHandler">Filter</button>
      <button type="submit" @click.prevent="clearFilter">Clear filter</button>
    </div>
  </form>
</template>

<script>
export default {
  name: 'TableFilterSearch',

  props: {
    jobs: Array,
    allMfr: Array,
    allType: Array,
    allStyle: Array,
    allColor: Array,
    allSize: Array
  },

  data() {
    return {
      searchValue: "",
      filterMfrId: null,
      filterTypeId: null,
      filterStyleId: null,
      filterColorId: null,
      filterSizeId: null
    }
  },

  watch: {
    searchValue() {

    }
  },

  methods: {
    async filterJobsHandler() {
      let filteredJobs = this.jobs;

      if (this.filterMfrId !== null) {
        filteredJobs = filteredJobs.filter(job => job.mfr_record_id === this.filterMfrId);
      }
      if (this.filterTypeId !== null) {
        filteredJobs = filteredJobs.filter(job => job.type_record_id === this.filterTypeId);
      }
      if (this.filterStyleId !== null) {
        filteredJobs = filteredJobs.filter(job => job.style_record_id === this.filterStyleId);
      }
      if (this.filterColorId !== null) {
        filteredJobs = filteredJobs.filter(job => job.color_record_id === this.filterColorId);
      }
      if (this.filterSizeId !== null) {
        filteredJobs = filteredJobs.filter(job => job.size_record_id === this.filterSizeId);
      }

      this.$emit('filter', filteredJobs);
    },

    clearFilter() {
      this.filterMfrId = null;
      this.filterTypeId = null;
      this.filterStyleId = null;
      this.filterColorId = null;
      this.filterSizeId = null;
      this.$emit('filter', this.jobs);
    }
  }
}
</script>