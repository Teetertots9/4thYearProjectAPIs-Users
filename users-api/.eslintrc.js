module.exports = {
    'parser': 'babel-eslint',
    'env': {
        'node': true,
        'mocha': true,
        'es6': true,
        "jest/globals": true,
    },
    'plugins': [
      'security',
      'jest'
    ],
    'extends': ['airbnb-base', 'plugin:security/recommended'],
    'rules': {
        'max-len': ['error', 100, 2, {
            ignoreUrls: true,
            ignoreTrailingComments: true,
            ignoreTemplateLiterals: true,
            ignoreRegExpLiterals: true
        }],
        'import/no-extraneous-dependencies': ['error', {
            'devDependencies': ["**/*test.js"]
        }],
    }
};
