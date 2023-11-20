const assert = require('assert');
const { Given, When, Then } = require('@cucumber/cucumber');
const axios = require('axios');

let apiUrl, response, err, startTime;

// //// Before each feature ///////////////////////////////////////

Given('I have an API endpoint {string}', function (endpoint) {
  apiUrl = endpoint;
});

When('I send a GET request', async function () {
  startTime = new Date().getTime();
  response = await axios.get(apiUrl)
  .then(response)
  .catch(error => {
    if (error.response) {
      err = error.response
    } else if (error.request) {
      err = error.request
      console.log('No response received');
    } else {
      err = error.message
      console.log('Error message:', err);
    }
  });
});

// //// Scenario 1 ///////////////////////////////////////

//@response_code

Then('the response status code should be {int}', function (statusCode) {
  assert.strictEqual(response.status, statusCode, `Response status code is ${response.status}`)
});

//@response_time

Then('the response time of the request is below {int} milliseconds', function (threshold) {
  const endTime = new Date().getTime();
  const elapsedTime = endTime - startTime;
  assert.ok(elapsedTime < threshold, `Response time exceeded ${threshold} milliseconds. Actual: ${elapsedTime} milliseconds`);
});

// //// Scenario 2 ///////////////////////////////////////

// @id

Then('the “id” field is never {string} or empty\\(“”) for all items present in the data array', function (value) {
  for (let i=0; i < response.data.schedule.elements.length; i++) {
    let string = response.data.schedule.elements[i].id;
    assert.ok(string !== value,`${string} in ${i+1} element is ${value}`)
    assert.ok(string.length !== 0, `${string} in ${i+1} element is empty`);
  }
});

// @type_episode

Then('the “type” in “episode” for every item is always {string}', function (title) {
  for (let i=0; i < response.data.schedule.elements.length; i++) {
    let string = response.data.schedule.elements[i].episode["type"];
    assert.strictEqual(string, title, `${string} in ${i+1} element is not ${title}`);
  }
});

// //// Scenario 3 ///////////////////////////////////////

// @title_episode

Then('the “title” field in “episode”, is never {string} or empty\\(“”) for any schedule item', function (value) {
  for (let i=0; i < response.data.schedule.elements.length; i++) {
    let string = response.data.schedule.elements[i].episode["title"];
    assert.ok(string !== value, `${string} in ${i+1} element is ${value}`); 
    assert.ok(string.length !== 0, `${string} in ${i+1} element is empty`);
  }
});

// //// Scenario 4 ///////////////////////////////////////

// @live

Then('the only one episode in the list has "{string}" field in “episode” as true', function (broadcasting) {
  const liveArray = [];
  for (let i=0; i < response.data.schedule.elements.length; i++) {
    let string = response.data.schedule.elements[i].episode[broadcasting];
    if (string) {
      liveArray.push(string);
    };
  }
  assert.strictEqual(liveArray.length, 1, `More than 1 episode(s) has/have ${broadcasting} field in “episode” as true`);
});

// //// Scenario 5 ///////////////////////////////////////

// @transmission

Then('the “transmission_start” date value is before the “transmission_end” date', function () {
  for (let i=0; i < response.data.schedule.elements.length; i++) {
    let startDate = response.data.schedule.elements[i].transmission_start;
    let endDate = response.data.schedule.elements[i].transmission_end;
    assert.ok(startDate < endDate, `Start date:${startDate} in ${i+1} element is after end date:${endDate}`);
  }
});

// //// Scenario 6 ///////////////////////////////////////

// @date

Then('the response headers, verify the “Date” value in range of {int} milliseconds', function(range) {
  let currentDate = new Date().getTime();
  let headersDate = new Date(response.headers.date);
  let verifyDate = currentDate - headersDate;
  assert.ok(verifyDate <= range, `Response headers "Date" is ${verifyDate} milliseconds and more than ${range} milliseconds`);
});

// //// Scenario 7 ///////////////////////////////////////

// @response_error_code

Then('the HTTP status code of the response is {int}', function(statusCode) {
  assert.strictEqual(err.status, statusCode, `Response status code is ${err.status}`);
});

// @response_error_properties
 
Then('the error object had the properties {string} and {string}', function(firstProperty, secondProperty) {
  let keys = Object.keys(err.data.error);
  assert.ok(keys.includes(firstProperty), `Object does not include ${firstProperty}`);
  assert.ok(keys.includes(secondProperty), `Object does not include ${secondProperty}`);
});
