<template>
  <CreateJobForm
    :allMfr = "allMfr"
    :allType = "allType"
    :allStyle = "allStyle"
    :allColor = "allColor"
    :allSize = "allSize"
  />
</template>

<script>
import CreateJobForm from '../components/CreateJobForm.vue';

export default {
  name: 'CreateJobView',

  emits: ['filter', 'deleteJob'],

  props: {
    jobs: Array,
    filteredJobs: Array,
    allMfr: Array,
    allType: Array,
    allStyle: Array,
    allColor: Array,
    allSize: Array
  },

  components: {
    CreateJobForm
  }
}
</script>
