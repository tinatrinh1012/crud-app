<template>
  <h3>Filters</h3>

  <form id="filter-form">
    <div class="grid-x">
      <div class="medium-4 cell">
        <input class="filter-input" type="text" placeholder="Search job ID" v-model="searchJobId">
      </div>
      <div class="medium-4 cell">
        <input class="filter-input" type="text" placeholder="Search style ID" v-model="searchStyleId">
      </div>
      <div class="medium-4 cell">
        <input class="filter-input" type="text" placeholder="Search color number" v-model="searchColorNumber">
      </div>
    </div>

    <div class="grid-x">
      <div class="medium-6 cell">
        <div>Manufacturer</div>
        <select class="filter-input" v-model="filterMfrId">
          <option :value="null">All</option>
          <option v-for="mfr in allMfr" :key="mfr.id" :value="mfr.id">{{ mfr.mfr_name }}</option>
        </select>
      </div>
      <div class="medium-6 cell">
        <div>Type</div>
        <select class="filter-input" v-model="filterTypeId">
          <option :value="null">All</option>
          <option v-for="typeOption in allType" :key="typeOption.id" :value="typeOption.id">{{ typeOption.type_name }}</option>
        </select>
      </div>
    </div>

    <div class="grid-x">
      <div class="medium-4 cell">
        <div>Style</div>
        <select class="filter-input" v-model="filterStyleId">
          <option :value="null">All</option>
          <option v-for="style in allStyle" :key="style.id" :value="style.id">{{ style.style_name }}</option>
        </select>
      </div>
      <div class="medium-4 cell">
        <div>Color</div>
        <select class="filter-input" v-model="filterColorId">
          <option :value="null">All</option>
          <option v-for="color in allColor" :key="color.id" :value="color.id">{{ color.color_name }}</option>
        </select>
      </div>
      <div class="medium-4 cell">
        <div>Size</div>
        <select class="filter-input" v-model="filterSizeId">
          <option :value="null">All</option>
          <option v-for="size in allSize" :key="size.id" :value="size.id">{{ size.size }}</option>
        </select>
      </div>
    </div>

    <div class="grid-x">
      <button type="submit" @click.prevent="filterHandler" class="button">Filter</button>
    </div>
    <div class="grid-x">
      <button type="submit" @click.prevent="clearFilter" class="button">Clear filter</button>
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
      searchJobId: "",
      searchStyleId: "",
      searchColorNumber: "",
      filterMfrId: null,
      filterTypeId: null,
      filterStyleId: null,
      filterColorId: null,
      filterSizeId: null
    }
  },

  methods: {
    async filterHandler() {
      const filteredJobs = this.jobs.filter(this.filterJobs);
      this.$emit('filter', filteredJobs);
    },

    filterJobs(job) {
      if (this.filterMfrId !== null && job.mfr_record_id !== this.filterMfrId) {
        return false;
      }
      if (this.filterTypeId !== null && job.type_record_id !== this.filterTypeId) {
        return false;
      }
      if (this.filterStyleId !== null && job.style_record_id !== this.filterStyleId) {
        return false;
      }
      if (this.filterColorId !== null && job.color_record_id !== this.filterColorId) {
        return false;
      }
      if (this.filterSizeId !== null && job.size_record_id !== this.filterSizeId) {
        return false;
      }
      if (this.searchJobId.length > 0 && `${job.id}` !== this.searchJobId) {
        return false;
      }
      if (this.searchStyleId.length > 0 && job.style_id !== this.searchStyleId) {
        return false;
      }
      if (this.searchColorNumber.length > 0 && `${job.color_num}` !== this.searchColorNumber) {
        return false;
      }

      return true;
    },

    clearFilter() {
      this.searchJobId = "";
      this.searchStyleId = "";
      this.searchColorNumber = "";
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