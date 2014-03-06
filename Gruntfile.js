module.exports = function(grunt) {
    var remote = {
        // username: 'midwestmeeks',
        // host: 'flavormeansbusiness.com',
        // path: 'webapps/flavormeansbusiness2',
        // db: 'midwestmeeks_fmb2',
        // uploads: 'assets'
    }

    var local = {
        // db: 'flavormeansbusiness'
    }


    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        sass: {
            dist: {
                files: { 'src/workspace/css/main.css': 'src/workspace/scss/main.scss' },
                options: {
                    style: 'compressed'
                }
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
            },
            misc: {
                files: ['**/*.xsl', '**/*.js'],
                options: {
                    event: ['added', 'changed']
                }
            }
        },


        exec: {
            //
            // remote database functions
            'send-dump-script': {
                cmd: 'scp dump.php ' + remote.username + '@' + remote.host + ':' + remote.path
            },

            'create-remote-dump': {
                cmd: 'curl http://' + remote.host + '/dump.php'
            },

            'get-remote-dump': {
                cmd: 'scp ' + remote.username + '@' + remote.host + ':' + remote.path + '/' + remote.db + '.sql .'
            },

            'cleanup-remote': {
                cmd: 'ssh ' + remote.username + '@' + remote.host + ' rm ' + remote.path + '/' + remote.db + '.sql ' + remote.path + '/dump.php'
            },

            'create-database': {
                cmd: 'echo drop database ' + local.db + '\\; create database ' + local.db + ' | mysql -uroot',
                exitCode: [0, 1]
            },

            'import-dump': {
                cmd: 'mysql -uroot ' + local.db + ' < ' + remote.db + '.sql'
            },

            'delete-dump': {
                cmd: 'rm ' + remote.db + '.sql'
            },


            //
            // remote user uploads
            'sync-user-files': {
                cmd: 'rm -rf src/workspace/' + remote.uploads + '; scp -r ' + remote.username + '@' + remote.host + ':' + remote.path + '/workspace/' + remote.uploads + ' src/workspace'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-exec');

    grunt.registerTask('default', ['watch']);
    grunt.registerTask('fetch', ['exec:send-dump-script', 'exec:create-remote-dump', 'exec:get-remote-dump', 'exec:cleanup-remote', 'exec:create-database', 'exec:import-dump', 'exec:delete-dump']);
}

