

// Load the SDK for JavaScript
const AWS = require('aws-sdk');

const { userpoolId, region } = process.env;

// Set the region
AWS.config.update({ region });

const CognitoIdentityServiceProvider = new AWS
  .CognitoIdentityServiceProvider({ apiVersion: '2016-04-19', region });

exports.handler = async (event, context, callback) => {
  try {
    console.log(event);
    const { params } = event;

    const deleteAccountParams = {
      Username: params.path.id, /* required */
      UserPoolId: userpoolId,
    };

    const response = await CognitoIdentityServiceProvider
      .adminDeleteUser(deleteAccountParams).promise();

    response.Message = 'User Deleted';

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
