const userOrganizationJson =
    r'{"UserEmail":"A","OrganizationID":"B","OrganizationName":"C","AssignmentTypes":["D"],"HasAssignment":true,"IsOrganizationMember":false}';
const userOrganizationCollectionJson = '[$userOrganizationJson]';

void main() {
  /*
  Because these "API model" classes are purely boilerplate for generated json_serializable logic,
  it is sufficient to cover the tests for these under the equivalent "model" classes, under
  ".\model\*", so longer as 100% coverage is achieved.
  */
}