<template>
  <h3>Jobs</h3>
  <table class="hover stack">
    <thead>
      <th>ID</th>
      <th>Manufactuer</th>
      <th>Type Name</th>
      <th>Type ID</th>
      <th>Style Name</th>
      <th>Style ID</th>
      <th>Color #</th>
      <th>Color Name</th>
      <th>Size</th>
      <th></th>
      <th></th>
    </thead>
    <tbody>
      <tr v-for="job in filteredJobs" :key="job.id">
        <td>{{ job.id }}</td>
        <td>{{ job.mfr_name }}</td>
        <td>{{ job.type_name }}</td>
        <td>{{ job.type_id }}</td>
        <td>{{ job.style_name }}</td>
        <td>{{ job.style_id }}</td>
        <td>{{ job.color_num }}</td>
        <td>{{ job.color_name }}</td>
        <td>{{ job.size }}</td>
        <td><router-link :to="`/update-job/${job.id}`" class="button small">Edit</router-link></td>
        <td><button @click.prevent="deleteJobHandler(job.id)" class="alert button small">Delete</button></td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  name: 'JobsTable',

  emits: ['deleteJob'],

  props: {
    filteredJobs: Array
  },

  methods: {
    async deleteJobHandler(jobId) {
      if (window.confirm(`Are you sure you want to delete job (ID: ${jobId})?`)) {
        let response = await fetch(`http://localhost:3001/delete-job/${jobId}`, {
          method: "DELETE",
          headers: {
            "Content-type": "application/json; charset=UTF-8"
          }
        })
        response = await response.json();

        if (response.message === "success") {
          this.$emit('deleteJob', jobId);
          window.alert(`Delete job (ID: ${jobId}) successfully`);
        } else {
          window.alert("Error: " + response.message);
        }
      }
    }
  }
}
</script>