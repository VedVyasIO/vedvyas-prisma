/*
  Warnings:

  - A unique constraint covering the columns `[url]` on the table `UserVideoSuggestion` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `UserVideoSuggestion_url_key` ON `UserVideoSuggestion`(`url`);
