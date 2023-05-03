<template>
  <TableFilterSearch
    :jobs="jobs"
    :all-mfr="allMfr"
    :all-type="allType"
    :all-style="allStyle"
    :all-color="allColor"
    :all-size="allSize"
    :fetch-jobs="fetchJobs"
    @filter="filteredJobs => this.$emit('filter', filteredJobs)"
  />
  <JobsTable
    :jobs="jobs"
    :filtered-jobs="filteredJobs"
    :fetch-jobs="fetchJobs"
    @delete-job="jobId => this.$emit('deleteJob', jobId)"
  />
</template>

<script>
import JobsTable from '../components/JobsTable.vue'
import TableFilterSearch from '@/components/TableFilterSearch.vue';

export default {
  name: 'JobsView',

  props: {
    jobs: Array,
    filteredJobs: Array,
    allMfr: Array,
    allType: Array,
    allStyle: Array,
    allColor: Array,
    allSize: Array,
    fetchJobs: Function
  },

  components: {
    JobsTable,
    TableFilterSearch
  }
}
</script>
