const SUPABASE_URL = "https://feegfzldvepfgpybvdxu.supabase.co";
const SUPABASE_PUBLISHABLE_KEY = "sb_publishable_GaDc2rtzpOMp6f_xpVa_yQ_YsXElZ58";

export default async function handler(request, response) {
  if (request.method !== "GET") return response.status(405).json({ ok: false });
  if (request.headers["user-agent"] !== "vercel-cron/1.0") {
    return response.status(403).json({ ok: false });
  }

  const day = new Date().toISOString().slice(0, 10);
  try {
    const result = await fetch(`${SUPABASE_URL}/rest/v1/project_heartbeat?on_conflict=day`, {
      method: "POST",
      headers: {
        apikey: SUPABASE_PUBLISHABLE_KEY,
        Authorization: `Bearer ${SUPABASE_PUBLISHABLE_KEY}`,
        "Content-Type": "application/json",
        Prefer: "resolution=merge-duplicates,return=minimal"
      },
      body: JSON.stringify({ day, source: "vercel-cron", touched_at: new Date().toISOString() })
    });
    if (!result.ok) throw new Error(`Supabase ${result.status}: ${await result.text()}`);
    return response.status(200).json({ ok: true, day });
  } catch (error) {
    console.error(error);
    return response.status(500).json({ ok: false });
  }
}
