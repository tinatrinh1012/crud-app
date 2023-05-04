<template>
  <h1>Update Job (ID: {{ job.id }})</h1>
  <form>
    <div>Manufacturer:</div>
    <select v-model="selectedMfrId">
      <option v-for="mfr in allMfr" :key="mfr.id" :value="mfr.id">{{ mfr.mfr_name }}</option>
    </select>

    <div>Type:</div>
    <select v-model="selectedTypeId">
      <option v-for="typeOption in allType" :key="typeOption.id" :value="typeOption.id">{{ typeOption.type_name }}</option>
    </select>

    <div>Style:</div>
    <select v-model="selectedStyleId">
      <option v-for="style in allStyle" :key="style.id" :value="style.id">{{ style.style_name }}</option>
    </select>

    <div>Color:</div>
    <select v-model="selectedColorId">
      <option v-for="color in allColor" :key="color.id" :value="color.id">{{ color.color_name }}</option>
    </select>

    <div>Size:</div>
    <select v-model="selectedSizeId">
      <option v-for="size in allSize" :key="size.id" :value="size.id">{{ size.size }}</option>
    </select>

    <div>
      <button class="button" type="submit" @click.prevent="updateJobHandler(job.id)">Update Job</button>
    </div>
  </form>
</template>

<script>
  export default {
    name: 'UpdateJobForm',

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
        job: {},
        selectedMfrId: null,
        selectedTypeId: null,
        selectedStyleId: null,
        selectedColorId: null,
        selectedSizeId: null
      }
    },

    async created() {
      this.job = await this.fetchJob(this.$route.params.jobId);
      this.selectedMfrId = this.job.mfr_record_id;
      this.selectedTypeId = this.job.type_record_id;
      this.selectedStyleId = this.job.style_record_id;
      this.selectedColorId = this.job.color_record_id;
      this.selectedSizeId = this.job.size_record_id;
    },

    methods: {
      async fetchJob(jobId) {
        const response = await fetch(`http://localhost:3001/job/${jobId}`);
        const jobData = await response.json();
        return jobData[0];
      },

      async updateJobHandler(jobId) {
        let response = await fetch(`http://localhost:3001/update-job/${jobId}`, {
          method: "PUT",
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
          window.alert(`Update job (ID: ${jobId}) successfully`);
        } else {
          window.alert("Error: " + response.message);
        }
      }
    }
  }
</script>