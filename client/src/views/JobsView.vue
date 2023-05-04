<template>
  <TableFilterSearch
    :jobs="jobs"
    :all-mfr="allMfr"
    :all-type="allType"
    :all-style="allStyle"
    :all-color="allColor"
    :all-size="allSize"
    @filter="filteredJobs => this.$emit('filter', filteredJobs)"
  />
  <JobsTable
    :filtered-jobs="filteredJobs"
    @delete-job="jobId => this.$emit('deleteJob', jobId)"
  />
</template>

<script>
import JobsTable from '../components/JobsTable.vue'
import TableFilterSearch from '@/components/TableFilterSearch.vue';

export default {
  name: 'JobsView',

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
    JobsTable,
    TableFilterSearch
  }
}
</script>
