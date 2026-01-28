const sharp = require('sharp');
const { globSync } = require('glob'); // Using Sync version for simpler debugging
const path = require('path');
const fs = require('fs');

// 1. Define where your images are (relative to project root)
// Use forward slashes even on Windows!
const targetFolder = 'storage/app/public/photos'; 

async function start() {
    console.log(`🚀 Script started...`);
    console.log(`📂 Looking in: ${path.resolve(targetFolder)}`);

    // 2. Find the files
    const files = globSync(`${targetFolder}/*.{png,jpg,jpeg}`);

    if (files.length === 0) {
        console.log("❌ No files found! Check your 'targetFolder' path.");
        // List files in that directory to see what's actually there
        if (fs.existsSync(targetFolder)) {
            console.log("Files actually in folder:", fs.readdirSync(targetFolder).slice(0, 5));
        }
        return;
    }

    console.log(`📸 Found ${files.length} images. Starting conversion...`);

    for (const file of files) {
        const fileData = path.parse(file);
        const outputName = path.join(fileData.dir, fileData.name + '.webp');

        try {
            await sharp(file)
                .resize(1200, null, {キット: 'inside', withoutEnlargement: true })
                .webp({ quality: 80 })
                .toFile(outputName);
            console.log(`✅ Converted: ${fileData.base} -> ${path.basename(outputName)}`);
        } catch (err) {
            console.error(`🛑 Error processing ${file}:`, err.message);
        }
    }
    console.log("🏁 All done!");
}

start();