const request = require('supertest');
const {expect} = require('expect');
const app = require('../server/server');

describe('Testing GET /job/:id endpoint', () => {
  it('respond with HTTP status code 200 and correct job record data', async () => { // add `async` keyword here
    const response = await request(app)
      .get('/job/2');
    const expectedJobData = [
      {
        id: 2,
        mfr_record_id: 2,
        type_record_id: 1,
        style_record_id: 2,
        color_record_id: 2,
        size_record_id: 2,
        mfr_name: 'Tarkett',
        type_name: 'Resilient',
        type_id: 1,
        style_name: 'Classic Plank',
        style_id: null,
        color_num: 3308,
        color_name: 'Ash',
        size: '12 x 24'
      }
    ]

    expect(response.status).toBe(200);
    expect(response.body).toStrictEqual(expectedJobData);
  });
});