// Step 1 import ....
// นำเข้าโมดูลต่าง ๆ ที่ต้องใช้ในโปรเจกต์
const express = require('express')  // ใช้สร้างแอปพลิเคชัน Express
const app = express()               // สร้างแอป Express
const morgan = require('morgan')   // ใช้สำหรับการ log ข้อมูลคำขอ HTTP
const { readdirSync } = require('fs') // ใช้เพื่ออ่านไฟล์ในโฟลเดอร์
const cors = require('cors')       // ใช้สำหรับจัดการการข้ามโดเมน (CORS)

// middleware
app.use(morgan('dev'))             // ใช้ morgan เพื่อ log คำขอ HTTP สำหรับการพัฒนา
app.use(express.json({ limit: '20mb' }))  // กำหนดขนาดสูงสุดของข้อมูลที่สามารถรับได้ในรูปแบบ JSON เป็น 20MB
app.use(cors())                    // เปิดใช้งาน CORS เพื่อให้สามารถเข้าถึง API จากโดเมนอื่นได้

// app.use('/api',authRouter)      // ใช้ router สำหรับการจัดการคำขอเกี่ยวกับการรับรองความถูกต้อง (auth)
// app.use('/api',categoryRouter)  // ใช้ router สำหรับการจัดการคำขอเกี่ยวกับหมวดหมู่ (category)

// อ่านไฟล์ทั้งหมดในโฟลเดอร์ 'routes' และเชื่อมโยง router จากไฟล์นั้น ๆ
readdirSync('./routes')
    .map((c) => app.use('/api', require('./routes/' + c)))  // ใช้ router ทุกไฟล์ที่พบจากโฟลเดอร์ routes

// Step 3 Router
// app.post('/api',(req,res)=>{  // ตัวอย่างการตั้งค่า router แบบ POST
//     // โค้ดการรับคำขอ POST
//     const { username,password } = req.body  // รับข้อมูล username และ password จาก body
//     console.log(username,password)  // พิมพ์ข้อมูล username และ password ลง console
//     res.send('Jukkru 555+')  // ส่งข้อความตอบกลับ
// })

// Step 2 Start Server
// เริ่มต้นเซิร์ฟเวอร์ที่พอร์ต 5001 และแสดงข้อความว่าเซิร์ฟเวอร์ทำงานแล้ว
app.listen(5001, 
    () => console.log('Server is running on port 5001'))  // เริ่มเซิร์ฟเวอร์และแสดงข้อความใน console
