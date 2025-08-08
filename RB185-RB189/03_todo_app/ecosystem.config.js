module.exports = {
  apps: [{
    name: "sinatra-todo-app",
    script: "./start_sinatra.sh",
    cwd: "/home/sandy/RB185-RB189/03_todo_app",
    env: {
      RACK_ENV: "production"
    }
  }]
};

