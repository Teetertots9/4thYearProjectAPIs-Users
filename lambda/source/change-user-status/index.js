

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
    const { params, body } = event;

    const changeAccountStatusParams = {
      Username: params.path.id, /* required */
      UserPoolId: userpoolId,
    };

    let response;

    if (body.status === 'enable') {
      response = await CognitoIdentityServiceProvider
        .adminEnableUser(changeAccountStatusParams).promise();
    } else if (body.status === 'disable') {
      response = await CognitoIdentityServiceProvider
        .adminDisableUser(changeAccountStatusParams).promise();
    } else {
      throw new Error('Status must be enable or disable');
    }

    response.Message = 'Account Status Updated';

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
