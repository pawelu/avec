var app = angular.module("Avec", []);
function SkillCtrl($scope) {

  $scope.data = 4;

  $scope.skills = [
  {text: 'Learn AngularJS', done:false},
  {text: 'Build an app', done:false}
  ];

  $scope.getTotalSkills = function () {
    return $scope.skills.length;
  };

  $scope.addSkill = function() {
    $scope.skills.push({text:$scope.formSkillText, done:false});
    $scope.formSkillText = '';
  };

  $scope.ratings = [
  {max:5, rating:0,name:"Skill"}
  ];

}

