import { execSync } from "child_process";

function exec(command) {
  execSync(command, {
    cwd: __dirname,
    stdio: "inherit",
  });
}

exec("npm install yarn -g");
exec("yarn --frozen-lockfile");
