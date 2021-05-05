'use strict';

// Load the SDK for JavaScript
const AWS = require('aws-sdk');

const { userpoolId, region } = process.env;

// Set the region
AWS.config.update({region});

const CognitoIdentityServiceProvider = new AWS.CognitoIdentityServiceProvider({apiVersion: '2016-04-19', region: region});

exports.handler = async (event, context, callback) => {
  try {
    console.log(event);
    const { body } = event;

    const createAccountParams = {
      Username: body.username, /* required */
      TemporaryPassword: body.temporaryPassword,
      UserPoolId: userpoolId
    };

    const response = await CognitoIdentityServiceProvider.adminCreateUser(createAccountParams).promise();

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
