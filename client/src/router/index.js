import { createRouter, createWebHistory } from 'vue-router'
import JobsView from '../views/JobsView.vue'
import CreateJobView from '../views/CreateJobView.vue'
import UpdateJobView from '../views/UpdateJobView.vue'

const routes = [
  {
    path: '/',
    name: 'jobs-view',
    component: JobsView,
  },
  {
    path: '/create-job',
    name: 'create-job',
    component: CreateJobView
  },
  {
    path: '/update-job/:jobId',
    name: 'update-job',
    component: UpdateJobView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
