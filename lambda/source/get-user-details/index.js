

// Load the SDK for JavaScript
const AWS = require('aws-sdk');

const { userpoolId, region } = process.env;

// Set the region
AWS.config.update({ region });

const CognitoIdentityServiceProvider = new AWS
  .CognitoIdentityServiceProvider({ apiVersion: '2016-04-19', region });

const arrayToObject = (array, keyField, valueField) => Object.assign({}, ...array
  .map(item => ({ [item[keyField]]: item[valueField] })));

const formatUserAttributes = (user) => {
  const attributes = arrayToObject(user.UserAttributes, 'Name', 'Value');
  return {
    ...user,
    UserAttributes: attributes,
  };
};

exports.handler = async (event, context, callback) => {
  try {
    console.log(event);
    const { params } = event;

    const getUserParams = {
      Username: params.path.id,
      UserPoolId: userpoolId,
    };

    let user = await CognitoIdentityServiceProvider.adminGetUser(getUserParams).promise();

    if (user.UserAttributes) {
      user = formatUserAttributes(user);
    }

    console.log(user);

    callback(null, user);
  } catch (err) {
    console.log(err);
    callback(err);
  }
};
