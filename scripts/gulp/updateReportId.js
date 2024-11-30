import fs from "fs";
import path from "path";
import { argv } from "./load-env.js";

function replaceSalesforceId() {
    const folderPath = path.join(
        __dirname,
        "..",
        "..",
        "force-app",
        "main",
        "default",
        "navigationMenus"
    );
    fs.access(folderPath, fs.constants.F_OK, (err) => {
        if (err) {
            return;
        }
    });
    const reportData = JSON.parse(
        fs.readFileSync(
            path.join(__dirname, "..", "environment", "reportId.json"),
            "UTF-8"
        )
    );

    const targetOrg = argv["target-org"] || argv["o"];
    if (!targetOrg || !reportData[targetOrg]) {
        console.error(
            "reportId.jsonに対象環境名" + targetOrg + "が存在しないです"
        );
        return;
    }

    const files = fs
        .readdirSync(folderPath)
        .filter((file) => file.endsWith(".xml"));

    files.forEach((file) => {
        const filePath = path.join(folderPath, file);
        let content = fs.readFileSync(filePath, "utf-8");
        content = content.replace(
            /<target>\/report\/([A-Za-z0-9]{18})<\/target>/g,
            (match, oldId) => {
                for (const org in reportData) {
                    const key = Object.keys(reportData[org]).find(
                        (k) => reportData[org][k] === oldId
                    );
                    if (key) {
                        const newId = reportData[targetOrg][key];
                        if (newId) {
                            return `<target>/report/${newId}</target>`;
                        }
                    }
                }
                return match;
            }
        );
        fs.writeFileSync(filePath, content, "utf-8");
    });
}

export function updateReportId(done) {
    replaceSalesforceId();
    return done();
}
