const AWS = require('aws-sdk');

const { region, userpoolId, clientId } = process.env;

// Set the region
AWS.config.update({ region });

const CognitoIdentityServiceProvider = new AWS.CognitoIdentityServiceProvider(
  { apiVersion: '2016-04-19', region },
);

exports.handler = async (event, context, callback) => {
  try {
    console.log(event);
    const { body } = event;

    const authenticateParams = {
      AuthFlow: 'ADMIN_NO_SRP_AUTH', /* required */
      AuthParameters: {
        USERNAME: body.username,
        PASSWORD: body.password,
      },
      UserPoolId: userpoolId,
      ClientId: clientId,
    };

    console.log('params');
    console.log(authenticateParams);

    const response = await CognitoIdentityServiceProvider
      .adminInitiateAuth(authenticateParams).promise();

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
