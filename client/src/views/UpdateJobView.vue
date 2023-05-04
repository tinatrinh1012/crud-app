<template>
  <UpdateJobForm
    :allMfr = "allMfr"
    :allType = "allType"
    :allStyle = "allStyle"
    :allColor = "allColor"
    :allSize = "allSize"
  />
</template>

<script>
import UpdateJobForm from '../components/UpdateJobForm.vue';

export default {
  name: 'UpdateJobView',

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
    UpdateJobForm
  }
}
</script>
