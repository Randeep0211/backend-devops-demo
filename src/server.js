import { app } from "./app.js";
import { config } from "./config/index.js";

const PORT = config.get("PORT") || 3000;

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
