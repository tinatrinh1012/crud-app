<template>
  <JobsTableFilter
    :jobs="jobs"
    :all-mfr="allMfr"
    :all-type="allType"
    :all-style="allStyle"
    :all-color="allColor"
    :all-size="allSize"
    :fetch-jobs="fetchJobs"
    @updated-jobs="updatedJobs => this.$emit('updatedJobs', updatedJobs)"
  />
  <JobsTable
    :jobs="jobs"
    :fetch-jobs="fetchJobs"
    @updated-jobs="updatedJobs => this.$emit('updatedJobs', updatedJobs)"
  />
</template>

<script>
import JobsTable from '../components/JobsTable.vue'
import JobsTableFilter from '@/components/JobsTableFilter.vue';

export default {
  name: 'JobsView',

  props: {
    jobs: Array,
    allMfr: Array,
    allType: Array,
    allStyle: Array,
    allColor: Array,
    allSize: Array,
    fetchJobs: Function
  },

  components: {
    JobsTable,
    JobsTableFilter
  }
}
</script>
