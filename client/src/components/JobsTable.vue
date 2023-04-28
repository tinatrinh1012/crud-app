<template>
  <h1>Jobs Table</h1>
  <table>
    <tr>
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
      <td>{{ job.mfr_name }}</td>
      <td>{{ job.type_name }}</td>
      <td>{{ job.type_id }}</td>
      <td>{{ job.style_name }}</td>
      <td>{{ job.style_id }}</td>
      <td>{{ job.color_num }}</td>
      <td>{{ job.color_name }}</td>
      <td>{{ job.size }}</td>
    </tr>
  </table>
</template>

<script>
export default {
  name: 'JobsTable',

  props: {
    jobs: Array
  }
}
</script>