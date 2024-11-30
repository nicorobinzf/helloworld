import fs from "fs";
import path from "path";
import minimist from "minimist";

export const argv = (() => {
    const _argv = minimist(process.argv.slice(2), {
        string: ["api-version", "a"]
    });
    if (!(_argv["manifest"] || _argv["x"])) {
        _argv["manifest"] = "manifest/package.xml";
    }
    if (!(_argv["test-level"] || _argv["l"])) {
        _argv["test-level"] = "RunLocalTests";
    }
    if (!(_argv["ignore-warnings"] || _argv["g"])) {
        _argv["ignore-warnings"] = true;
    }
    if (!(_argv["wait"] || _argv["w"])) {
        _argv["wait"] = 90;
    }
    return _argv;
})();

export function loadEnv(done) {
    const envId = (argv["env"] || "").toLowerCase();
    const org = (argv["target-org"] || argv["o"] || "").toLowerCase();
    const envJson = JSON.parse(
        fs.readFileSync(
            path.join(__dirname, "..", "environment", "environment.json"),
            process.env.encoding || "UTF-8"
        )
    );
    if (!envJson[envId || org]) {
        console.log(
            `Warning: ${envId || org}環境変数が見つかりません。デフォルト環境変数を利用します。`
        );
    }
    process.env = {
        ...process.env,
        ...(envJson[envId || org] || envJson["dev"])
    };
    return done();
}
