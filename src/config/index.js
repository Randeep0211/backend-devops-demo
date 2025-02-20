import dotenv from "dotenv";

dotenv.config({ path: ".env" });

const _config = {
  PORT: process.env.PORT,
};

export const config = {
  get(key) {
    const value = _config[key];
    if (!value) {
      console.error(
        `Key ${key} variable not found. Make sure to pass environment variable.`
      );
    }
    return _config[key];
  },
};
