define([], function() {
    'use strict';

    function ListKitController($scope, kitService, alertService, analysisTypeService) {

        $scope.activeOption = -1;
        $scope.loadKits();

        analysisTypeService.listById().then(function(response) {
            $scope.analysisTypes = response;
        });

        $scope.$watch('kitsByAnalysisType', function() {
            if ($scope.kitsByAnalysisType) {
                $scope.options = Object.keys($scope.kitsByAnalysisType);
                $scope.show($scope.activeOption);
            }
        });

        $scope.show = function(index) {
            $scope.activeOption = index;
            if (index === -1) {
                $scope.kitSearch = $scope.kits;
            } else {
                $scope.kitSearch = $scope.kitsByAnalysisType[$scope.options[index]];
            }

            if ($scope.kitSearch.length === 0) {
                $scope.noResult = true;
            } else {
                $scope.noResult = false;
            }
        };

        $scope.remove = function(id) {
            $scope.isProcessing = true;
            kitService.delete(id).then(function() {
                alertService.success({message: 'Se ha eliminado el kit satisfactoriamente'});
                $scope.loadKits();
                $scope.isProcessing = false;
            }, function(response) {
                alertService.error(response.data);
                $scope.isProcessing = false;
            });
        };
        
    }

    return ListKitController;

});