import { createRouter, createWebHistory } from 'vue-router'
import JobsView from '../views/JobsView.vue'
import CreateJobForm from '../components/CreateJobForm.vue'
import UpdateJobForm from '../components/UpdateJobForm.vue'

const routes = [
  {
    path: '/',
    name: 'jobs',
    component: JobsView
  },
  {
    path: '/create-job',
    name: 'create-job',
    component: CreateJobForm
  },
  {
    path: '/update-job/:jobId',
    name: 'update-job',
    component: UpdateJobForm
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
