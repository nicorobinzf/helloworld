import { exec } from "child_process";
import { argv } from "./load-env";

// SFDXデプロイのコマンド
function validatePackageCommand() {
    return new Promise((resolve) => {
        const _argv = Object.keys(argv)
            .filter((k) => !["_", "env"].find((_k) => _k === k))
            .reduce(
                (pre, curr) => [
                    ...pre,
                    ` ${curr.length === 1 ? "-" : "--"}${curr}${typeof argv[curr] === "boolean" ? "" : " " + argv[curr]}`
                ],
                []
            )
            .join("");
        const cmd = "sf project deploy start --dry-run" + _argv;
        console.log(cmd);
        return exec(
            cmd,
            { maxBuffer: 1024 * 1024 * 1000 },
            (err, stdout, stderr) => {
                console.log(stdout);
                console.log(!!stderr ? "stderr: \n" + stderr : "");
                console.log(!!err ? "err: \n" + err : "");
                resolve({
                    messege: stdout,
                    error: stderr || err,
                    isSuccess: !err
                });
            }
        );
    });
}

// sf validate
export function validatePackage(done) {
    return (async () => {
        const result = await validatePackageCommand();
        return result.isSuccess
            ? done()
            : done(new Error(`デプロイ検証失敗しました。`));
    })();
}
