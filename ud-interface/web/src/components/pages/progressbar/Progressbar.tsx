import React, { useState, useEffect } from 'react';
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';

export default function CircularProgressbar() {
    const [progress, setProgress] = useState(0);
    const [color, setColor] = useState<'secondary' | 'inherit' | 'primary' | 'error' | 'info' | 'success' | 'warning'>('secondary');
    const [visible, setVisible] = useState(false);

    useEffect(() => {
        const handleMessage = (event: MessageEvent) => {
            const data = event.data;
            if (data.type === 'showProgressbar') {
                const { color, duration } = data;
                setColor(color);
                setVisible(true);
                setProgress(0);

                const interval = setInterval(() => {
                    setProgress((prevProgress) => {
                        if (prevProgress >= 100) {
                            clearInterval(interval);
                            setVisible(false);
                            return 100;
                        }
                        return prevProgress + (100 / (duration / 100));
                    });
                }, 100);
            }
        };

        window.addEventListener('message', handleMessage);
        return () => {
            window.removeEventListener('message', handleMessage);
        };
    }, []);

    if (!visible) return null;

    return (
        <Box
            sx={{ display: 'flex', position: 'fixed', bottom: 10, left: '50%', transform: 'translateX(-50%)', zIndex: 9999 }}
        >
            <CircularProgress color={color} variant="determinate" value={progress} />
        </Box>
    );
}