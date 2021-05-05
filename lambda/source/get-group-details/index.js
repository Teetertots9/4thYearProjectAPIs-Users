

// Load the SDK for JavaScript
const AWS = require('aws-sdk');

const { userpoolId, region } = process.env;

// Set the region
AWS.config.update({ region });

const CognitoIdentityServiceProvider = new AWS
  .CognitoIdentityServiceProvider({ apiVersion: '2016-04-19', region });

const arrayToObject = (array, keyField, valueField) => Object
  .assign({}, ...array.map(item => ({ [item[keyField]]: item[valueField] })));

const formatUserAttributes = users => users.map((user) => {
  const attributes = arrayToObject(user.Attributes, 'Name', 'Value');
  return {
    ...user,
    Attributes: attributes,
  };
});

exports.handler = async (event, context, callback) => {
  try {
    console.log(event);
    const { params } = event;

    const { group } = params.path;
    const { nextToken } = params.querystring;
    const { limit } = params.querystring;

    const listUsersInGroupParams = {
      UserPoolId: userpoolId,
      GroupName: group,
    };

    if (nextToken) {
      listUsersInGroupParams.NextToken = nextToken;
    }
    if (limit && limit > 0) {
      listUsersInGroupParams.Limit = limit;
    }

    const response = await CognitoIdentityServiceProvider
      .listUsersInGroup(listUsersInGroupParams).promise();

    response.Users = formatUserAttributes(response.Users);

    console.log(response);

    callback(null, response);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
