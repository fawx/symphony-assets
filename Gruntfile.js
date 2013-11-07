module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        
        sass: {
            dist: {
                files: { 'src/workspace/css/main.css': 'src/workspace/scss/main.scss' },
                style: 'compressed'
            }
        },

        watch: {
            options: {
                livereload: true
            },
            sass: {
                files: ['**/*.scss'],
                tasks: ['sass'],
                options: {
                    event: ['added', 'changed']
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['sass']);
}
