<template>
  <JobsTableFilter />
  <JobsTable />
</template>

<script>
import JobsTable from '../components/JobsTable.vue'
import JobsTableFilter from '@/components/JobsTableFilter.vue';

export default {
  name: 'JobsView',

  components: {
    JobsTable,
    JobsTableFilter
  }
}
</script>
