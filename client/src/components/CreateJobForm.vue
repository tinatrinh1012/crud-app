<template>
  <h3>Add Job</h3>
  <form id="create-job-form">
    <div class="grid-x">
      <div class="medium-6 cell">
        <div>Manufacturer</div>
        <select v-model="selectedMfrId">
          <option disabled :value="null">Select Manufacturer</option>
          <option v-for="mfr in allMfr" :key="mfr.id" :value="mfr.id">{{ mfr.mfr_name }}</option>
        </select>
      </div>
      <div class="medium-6 cell">
        <div>Type</div>
        <select v-model="selectedTypeId">
          <option disabled :value="null">Select Type</option>
          <option v-for="typeOption in allType" :key="typeOption.id" :value="typeOption.id">{{ typeOption.type_name }}</option>
        </select>
      </div>
    </div>

    <div class="grid-x">
      <div class="medium-4 cell">
        <div>Style</div>
        <select v-model="selectedStyleId">
          <option disabled :value="null">Select Style</option>
          <option v-for="style in allStyle" :key="style.id" :value="style.id">{{ style.style_name }}</option>
        </select>
      </div>
      <div class="medium-4 cell">
        <div>Color</div>
        <select v-model="selectedColorId">
          <option disabled :value="null">Select Color</option>
          <option v-for="color in allColor" :key="color.id" :value="color.id">{{ color.color_name }}</option>
        </select>
      </div>
      <div class="medium-4 cell">
        <div>Size</div>
        <select v-model="selectedSizeId">
          <option disabled :value="null">Select Size</option>
          <option v-for="size in allSize" :key="size.id" :value="size.id">{{ size.size }}</option>
        </select>
      </div>
    </div>

    <div class="grid-x">
      <button class="button" type="submit" @click.prevent="addJobHandler">Add New Job</button>
    </div>
  </form>
</template>

<script>
export default {
  name: 'CreateJobForm',

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
    async addJobHandler() {
      if (this.selectedMfrId == null || this.selectedTypeId == null || this.selectedStyleId == null || this.selectedColorId == null || this.selectedSizeId == null) {
        window.alert("Please fill out all the fields.");
        return;
      }

      let response = await fetch("http://localhost:3001/create-job", {
        method: "POST",
        body: JSON.stringify({
          mfr_record_id: this.selectedMfrId,
          type_record_id: this.selectedTypeId,
          style_record_id: this.selectedStyleId,
          color_record_id: this.selectedColorId,
          size_record_id: this.selectedSizeId
        }),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }
      })
      response = await response.json();

      if (response.message === "success") {
        window.alert("Create new job successfully");
      } else {
        window.alert("Error: " + response.message);
      }
    }
  }
}
</script>