/**
 * @name gulpfile.babel.js
 * @description gulpfile
 */
import { series } from "gulp";
import { loadEnv } from "./scripts/gulp/load-env.js";

exports.vali = series(loadEnv);
