// update-global.js
const { execSync } = require("child_process");
const output = execSync("bun list -g --depth=0", { encoding: "utf-8" });
const packages = output
  .split("\n")
  .filter(
    (line) => line.includes("@") || (line.trim() && !line.includes("packages")),
  )
  .slice(2) // 跳过表头
  .map((line) => line.split(" ")[0])
  .filter((pkg) => pkg);

packages.forEach((pkg) => {
  console.log(`Updating ${pkg}...`);
  try {
    execSync(`bun add -g ${pkg}`, { stdio: "inherit" });
  } catch (error) {
    console.error(`Failed to update ${pkg}`);
  }
});
