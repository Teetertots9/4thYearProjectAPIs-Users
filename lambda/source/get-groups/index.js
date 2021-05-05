

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

    const { nextToken } = params.querystring;
    const { limit } = params.querystring;

    const listGroupsParams = {
      UserPoolId: userpoolId,
    };

    if (nextToken) {
      listGroupsParams.NextToken = nextToken;
    }
    if (limit && limit > 0) {
      listGroupsParams.Limit = limit;
    }

    const response = await CognitoIdentityServiceProvider.listGroups(listGroupsParams).promise();

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
