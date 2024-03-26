-- CreateTable
CREATE TABLE `Contest` (
    `id` VARCHAR(255) NOT NULL,
    `title` VARCHAR(500) NOT NULL,
    `startDate` DATETIME(3) NOT NULL,
    `endDate` DATETIME(3) NOT NULL,
    `status` ENUM('NOTSTARTED', 'STARTED', 'COMPLETED', 'DISCARDED') NOT NULL DEFAULT 'NOTSTARTED',
    `topicId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContestDetail` (
    `contestId` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `importantNote` TEXT NOT NULL,
    `sponsoredNote` TEXT NOT NULL,
    `announcement` TEXT NOT NULL,

    PRIMARY KEY (`contestId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChallengeSet` (
    `id` VARCHAR(255) NOT NULL,
    `title` VARCHAR(500) NOT NULL,
    `description` TEXT NOT NULL,
    `contestId` VARCHAR(255) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `ChallengeSet_contestId_key`(`contestId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Challenge` (
    `id` VARCHAR(255) NOT NULL,
    `title` VARCHAR(500) NOT NULL,
    `level` ENUM('EASY', 'MEDIUM', 'HARD') NOT NULL DEFAULT 'EASY',
    `type` ENUM('CODING', 'QNA', 'SUBMISSION') NOT NULL,
    `description` TEXT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChallengeSetsChallengeMapping` (
    `challengeId` VARCHAR(255) NOT NULL,
    `challengeSetId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`challengeId`, `challengeSetId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TestCase` (
    `id` VARCHAR(255) NOT NULL,
    `input` TEXT NOT NULL,
    `output` TEXT NOT NULL,
    `challengeId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ChallengeOption` (
    `id` VARCHAR(255) NOT NULL,
    `options` TEXT NOT NULL,
    `answer` TEXT NOT NULL,
    `challengeId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `ChallengeOption_challengeId_key`(`challengeId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserSubmission` (
    `id` VARCHAR(255) NOT NULL,
    `url` TEXT NULL,
    `submission` TEXT NULL,
    `challengeId` VARCHAR(255) NOT NULL,
    `userId` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Contest` ADD CONSTRAINT `Contest_topicId_fkey` FOREIGN KEY (`topicId`) REFERENCES `Topic`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ContestDetail` ADD CONSTRAINT `ContestDetail_contestId_fkey` FOREIGN KEY (`contestId`) REFERENCES `Contest`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeSet` ADD CONSTRAINT `ChallengeSet_contestId_fkey` FOREIGN KEY (`contestId`) REFERENCES `Contest`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeSetsChallengeMapping` ADD CONSTRAINT `ChallengeSetsChallengeMapping_challengeId_fkey` FOREIGN KEY (`challengeId`) REFERENCES `Challenge`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeSetsChallengeMapping` ADD CONSTRAINT `ChallengeSetsChallengeMapping_challengeSetId_fkey` FOREIGN KEY (`challengeSetId`) REFERENCES `ChallengeSet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TestCase` ADD CONSTRAINT `TestCase_challengeId_fkey` FOREIGN KEY (`challengeId`) REFERENCES `Challenge`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ChallengeOption` ADD CONSTRAINT `ChallengeOption_challengeId_fkey` FOREIGN KEY (`challengeId`) REFERENCES `Challenge`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSubmission` ADD CONSTRAINT `UserSubmission_challengeId_fkey` FOREIGN KEY (`challengeId`) REFERENCES `Challenge`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSubmission` ADD CONSTRAINT `UserSubmission_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
