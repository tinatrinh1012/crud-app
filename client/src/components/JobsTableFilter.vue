<template>
  <h2>Filters</h2>

  <form>
    <div>Manufacturer:</div>
    <select v-model="selectedMfrId">
      <option disabled :value="null">Filter by Manufacturer</option>
      <option v-for="mfr in allMfr" :key="mfr.id" :value="mfr.id">{{ mfr.mfr_name }}</option>
    </select>

    <div>Type:</div>
    <select v-model="selectedTypeId">
      <option disabled :value="null">Filter by Type</option>
      <option v-for="typeOption in allType" :key="typeOption.id" :value="typeOption.id">{{ typeOption.type_name }}</option>
    </select>

    <div>Style:</div>
    <select v-model="selectedStyleId">
      <option disabled :value="null">Filter by Style</option>
      <option v-for="style in allStyle" :key="style.id" :value="style.id">{{ style.style_name }}</option>
    </select>

    <div>Color:</div>
    <select v-model="selectedColorId">
      <option disabled :value="null">Filter by Color</option>
      <option v-for="color in allColor" :key="color.id" :value="color.id">{{ color.color_name }}</option>
    </select>

    <div>Size:</div>
    <select v-model="selectedSizeId">
      <option disabled :value="null">Filter by Size</option>
      <option v-for="size in allSize" :key="size.id" :value="size.id">{{ size.size }}</option>
    </select>

    <div>
      <button type="submit" @click.prevent="filterJobsHandler">Filter</button>
    </div>
  </form>
</template>

<script>
export default {
  name: 'JobsTableFilter',

  props: {
    allMfr: Array,
    allType: Array,
    allStyle: Array,
    allColor: Array,
    allSize: Array,
    fetchJobs: Function
  },

  data() {
    return {
      selectedMfrId: null,
      selectedTypeId: null,
      selectedStyleId: null,
      selectedColorId: null,
      selectedSizeId: null
    }
  },

  methods: {
    async filterJobsHandler() {
      // let response = await fetch("http://localhost:3001/create-job", {
      //   method: "POST",
      //   body: JSON.stringify({
      //     mfr_record_id: this.selectedMfrId,
      //     type_record_id: this.selectedTypeId,
      //     style_record_id: this.selectedStyleId,
      //     color_record_id: this.selectedColorId,
      //     size_record_id: this.selectedSizeId
      //   }),
      //   headers: {
      //     "Content-type": "application/json; charset=UTF-8"
      //   }
      // })
      // response = await response.json();

      // if (response.message === "success") {
      //   const updatedJobs = await this.fetchJobs();
      //   this.$emit('updatedJobs', updatedJobs);

      //   window.alert("Create new job successfully");
      // } else {
      //   window.alert("Error: " + response.message);
      // }
    }
  }
}
</script>